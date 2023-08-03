require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3220.0.0-darwin-x64.tar.gz"
    sha256 "c895fd7b349f670c3df3a8331322502bd9004703554414fa368235e68c0c40b7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3220.0.0-darwin-arm64.tar.gz"
      sha256 "a789b551a736f7bcbe95239e3d1dff849afa34f35417fe82a65a365d7b43ae3c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3220.0.0-linux-x64.tar.gz"
    sha256 "fcd6cbade0b3b423cb4724110e906efdbb62e212ed3b5c09a7df09e5bead1fad"
  end
  version "3220.0.0"
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
