require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.25-darwin-x64.tar.gz"
    sha256 "22466e98e82c343215e7ccadd69ec4add6b7443496e749357f8dd1f583a29fab"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.25-darwin-arm64.tar.gz"
      sha256 "8bc28c8238fbb33decfa6476ff5f4f497315b4730cdc992db8b1c089b578db03"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.25-linux-x64.tar.gz"
    sha256 "a4a3770e6789c80e0445d18c6117c9754bc8b106aef6c0f2747d58cb51aefa5c"
  end
  version "2023.4.25"
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
