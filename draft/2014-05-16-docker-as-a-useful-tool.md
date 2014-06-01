도커의 기본적인 혹은 최종적인 목표는 실제 어플리케이션 배포에 있습니다만

## Gitlab

Gitlab은 Github의 대표적인 대체 오픈소스입니다. 개인적으로 공개 돼있는 소스 코드나 업무 용도 이외의 코드는 전부 개인적으로 설치해둔 Gitlab에서 관리를 하고 있습니다. Gitlab은 매우 유용한 툴입니다만, 오래 전부터 설치가 어렵기로 유명했습니다. 기본적으로 루비 온 레일즈에 기반한 Gitlab은 프로그램의 특성상 데이터베이스는 물론 매우 다양한 라이브러리에 의존해서 만들어져있습니다. 따라서 이러한 의존성을 자신의 환경에서 완벽하게 재현한다는 것은 결코 쉬운 일이 아닙니다. 실제로 Gitlab 설치에 다룬 글도 다수 있을 뿐아니라, 설치해본 분은 이해하시겠지만 이런 설명서를 그대로 따라해도 설치가 되지 않는 경우가 다반사입니다. 지금은 그냥 방치하고 있긴 합니다만, 저 역시 매번 설치할 때마다, 그리고 업그레이드할 때마다 고생을 했던 기억이 납니다.

자, 그럼 그런 고생은 다른 분들에게 맡기고,

여기서는 도커를 사용해 이미 만들어진 sameersbn/gitlab 이미지를 실행해보겠습니다.

```sh
$ docker pull sameersbn/gitlab:latest
```

레이어가 많아서 이미지를 다운로드 받는 데는 시간이 좀 걸릴 것입니다. 빌드된 이미지가 다수 있으므로 시간을 절약하기 위해서 여기서는 `latest` 태그가 붙은 이미지만 다운로드 받습니다.

다운로드가 완료되면 이미지를 실행합니다. 여기서 `-d`는 백그라운드 실행을 의미해며, `-p`는 각각 포트 맵핑을 의미합니다. 예를 들어 `10022:22`는 도커 컨테이너 내부의 22번 포트를 도커 호스트의 10022 포트에 연결해줍니다. `-e`에는 적절한 환경 변수를 지정합니다.

```
$ docker run --name='gitlab' -d -p 10022:22 -p 10080:80 -e "GITLAB_PORT=10080" -e "GITLAB_SSH_PORT=10022" sameersbn/gitlab:latest
1e5f2425712b4336eef4ecfa9e62bc07e41c59845e11d25bb7f82d2d49024b8a
```

위와 같이 실행하면 `1e5f242...`과 같이 컨테이너의 해시값이 리턴됩니다. 이 해시값을 가지고 컨테이너의 로그를 출력해봅니다.

```
$ docker logs 1e5f242
User: root Password: eiSe2rei9ien
....
login.........admin@local.host
password......5iveL!fe
```

로그를 통해 임의로 생성된 ssh 비번과 gitlab 웹페이지의 기본 계정 정보를 확인할 수 있습니다.

![](/images/2014-05-16-docker-as-a-useful-tool/gitlab1.png)





```






## Yobi 설치