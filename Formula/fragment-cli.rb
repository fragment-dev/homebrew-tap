require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.28-darwin-x64.tar.gz"
    sha256 "abfe5e1b4eea7bfff06fe66a3e006bcbb85107b70a940e586cb1f93d2a1d8912"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.28-darwin-arm64.tar.gz"
      sha256 "51a45c267473d878cb6f34d0677117c6bfb050f4c5dc652170f67f0ac46081df"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.28-linux-x64.tar.gz"
    sha256 "80e981de2d9910b3f46adabbd9e20d1110d320a278cdf8df39a606ee09dc7c82"
  end
  version "2024.5.28"
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
