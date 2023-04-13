require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.13-darwin-x64.tar.gz"
    sha256 "05462b3623dd48f0355765777082c682fbde884cf032bb9388a9516af6a8ca5c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.13-darwin-arm64.tar.gz"
      sha256 "add09de6433abe914cad1d2effe6a0a973148ddfdb16077213af036dc7ccb6ed"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.13-linux-x64.tar.gz"
    sha256 "065f684407d04009096649d13495a1d64fdfacb3c14b820d2c3d33f4010f7eef"
  end
  version "2023.4.13"
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
