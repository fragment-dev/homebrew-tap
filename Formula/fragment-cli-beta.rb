require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5650.0.0-darwin-x64.tar.gz"
    sha256 "0939ccf1415fa11a419dc5b1858e56d451346c15d44c4cb79d41d6d2f456cffd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5650.0.0-darwin-arm64.tar.gz"
      sha256 "a4fa909c417d06e23dc5f7618d8447d3387461b37db982e84c4945ebb8d4b4fd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5650.0.0-linux-x64.tar.gz"
    sha256 "31f58d6be1ec4ed06dd450d172b60be948afd9429a75c97bf10d980a373c2a6d"
  end
  version "5650.0.0"
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
