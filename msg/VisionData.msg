# 인식 X 경우 유효하지 않은 값 리턴 (ex. -1000)

float64 timestamp           # 이미지를 받은 순간의 타임스탬프
float64 frame_drop          # 프레임 드롭 여부 (0.0: 정상, 1.0: 드롭 발생)

# 장애물의 위치 좌표가 고정이므로 인식된 장애물로부터의 거리를 이용해 현재 좌표 도출
# ex) 구간 1의 가운데 장애물과의 거리가 y: 0.6(60cm), x: 0.1(10cm)의 경우
#     구간 1의 가운데 장애물 좌표(1.5, 0.75)이므로 (y, x)
#     현재 좌표(1.5 - 0.6, 0.75 - 0.1) = (0.9, 0.65)
float64 camera_x            # 현재 카메라의 x 좌표 (양수, m)
float64 camera_y            # 현재 카메라의 y 좌표 (양수, m)

float64 left_x_1_dist       # 왼쪽 라인과 카메라와의 거리 (양수, m)
float64 right_x_2_dist      # 오른쪽 라인과 카메라와의 거리 (양수, m)
float64 theta               # y축과 현재 로봇의 방향의 각도 (rad값)

# 장애물 위치 (좌, 중, 우 | 0.0 / 1.0)
# ex) (0, 1, 1), (1, 0, 0), (1, 0, 1) ...
float64[3] section_1
float64[3] section_2
float64[3] section_3

# 구간 인식 여부
float64 section_1_detected  # 1.5m 구간 (0.0 / 1.0)
float64 section_2_detected  # 3.0m 구간 (0.0 / 1.0)
float64 section_3_detected  # 4.5m 구간 (0.0 / 1.0)

# 현재 vision 화면 상에서 가장 가까운 라인 (1.5m, 3.0m, 4.5m, 6.0m)
float64[4] nearest_line     # ex) (0.0, 1.0, 0.0, 0.0)

# 현재 가장 가까운 구간의 장애물 상세 상대 거리 (vision 기준, m)
float64[2] obstacle_1       # (y_dist_diff, x_dist_diff)
float64[2] obstacle_2       # (y_dist_diff, x_dist_diff)
float64[2] obstacle_3       # (y_dist_diff, x_dist_diff)

# vision 하단 구간 장애물 픽셀 비율 (range: 0.00 ~ 1.00)
float64[3] obstacle_ratio   # ex. (0.63, 0.72, 0.15) // 왼쪽 중간 오른쪽 순

float64 confidence          # 장애물 confidence (0.01 ~ 1.00)