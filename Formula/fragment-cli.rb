require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.8-darwin-x64.tar.gz"
    sha256 "4cbd1d7408c6ff0cf81a9053d5eea7e25ded5cb0d7a67372133e5a99600c41c2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.8-darwin-arm64.tar.gz"
      sha256 "b23f11c52703b303158be9c37f10abf1cdb723cccaedc3690fca34754bee0eac"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.8-linux-x64.tar.gz"
    sha256 "c727ccad9cf246835fbd19f594302d983682e14ed7579ff05b2eef5e81aff3e9"
  end
  version "2023.8.8"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
