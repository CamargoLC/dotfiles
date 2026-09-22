#!/usr/bin/env sh

# Diretório temporário para a capa do álbum
TMP_DIR="/tmp/rmpc"
mkdir -p "$TMP_DIR"
ALBUM_ART_PATH="$TMP_DIR/notification_cover"

# Salva a capa do álbum da música atual e envia a notificação
if rmpc albumart --output "$ALBUM_ART_PATH"; then
    notify-send -i "$ALBUM_ART_PATH" "Tocando agora" "$ARTIST - $TITLE"
else
    notify-send "Tocando agora" "$ARTIST - $TITLE"
fi
