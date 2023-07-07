require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3017.0.0-darwin-x64.tar.gz"
    sha256 "2f1cb3d61f5c9a20783721e308bffbed3a6241aa18cf6938f974b912a7e05945"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3017.0.0-darwin-arm64.tar.gz"
      sha256 "4135189d37c2b1eb1de9f9bee2a35ea7e38f166f97a6a0ee243f7492bab5c9a2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3017.0.0-linux-x64.tar.gz"
    sha256 "22628a18753901dc79e64cbc60f4e58437d32995c4688fe13b018bec65848143"
  end
  version "3017.0.0"
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
