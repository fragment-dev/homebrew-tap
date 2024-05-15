require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.15-2-darwin-x64.tar.gz"
    sha256 "5a257c8fff614e0c4fd05eb12a49020c4dd86f05b0df2916047262c5d51f4233"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.15-2-darwin-arm64.tar.gz"
      sha256 "aa8344e4fa00685eebbd8d5a8bf03672656b158c3a45bc4ef358d98f05422637"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.15-2-linux-x64.tar.gz"
    sha256 "130716c5bd052ca0dccfb901a2274e70c27257cc8e2cf9b2c0688ccba1874d5f"
  end
  version "2024.5.15-2"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
