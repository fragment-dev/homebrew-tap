require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5142.0.0-darwin-x64.tar.gz"
    sha256 "e76448e43a579b651832af1bb0ac1697c118d8db5ddc2edb89d7d554d9bb7819"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5142.0.0-darwin-arm64.tar.gz"
      sha256 "a229a8f0446a603720e3db9ff41874fd31119c893f21b8e0a18a33845ea4c0d1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5142.0.0-linux-x64.tar.gz"
    sha256 "a70ade78efb676186024249f361b34009a9d40b1416bd3a5bccfaf753346adca"
  end
  version "5142.0.0"
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
