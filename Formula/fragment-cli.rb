require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.23-darwin-x64.tar.gz"
    sha256 "47ae37217e7c08ad36ccbc2dd3f83fd58e6aadf5ed9fabf9ec60ed8c3caafd0a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.23-darwin-arm64.tar.gz"
      sha256 "cce351b3351ab985ac06ebf78435fc31e7286058657aea3da5105af6068157f5"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.23-linux-x64.tar.gz"
    sha256 "4ebd8f94c8c85c35e03c2eeb554e5863cf920ff45695ebfa1b84abbbdf66a29c"
  end
  version "2023.10.23"
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
