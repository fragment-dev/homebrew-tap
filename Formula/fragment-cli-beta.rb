require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4867.0.0-darwin-x64.tar.gz"
    sha256 "6f9a57e7a19be8dd70b0486ddd666a1ff5851075d31efd86e0a95081aad6f5af"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4867.0.0-darwin-arm64.tar.gz"
      sha256 "f86c41e36597a8e038abc106aeefa64a97253aa7d606c81161c95fa9ba4961a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4867.0.0-linux-x64.tar.gz"
    sha256 "67883ba467bea1f5266467cb8ff92552651de4b060699bd249301267bfde883a"
  end
  version "4867.0.0"
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
