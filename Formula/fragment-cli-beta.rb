require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5953.0.0-darwin-x64.tar.gz"
    sha256 "cb967c84f7600d045d646ff3a20781cd68bb551219302c837d34bf04d373cb2c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5953.0.0-darwin-arm64.tar.gz"
      sha256 "9a5f89a4b320c54300760a2324c8d40561f27b797a21e546f31065933d5ee150"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5953.0.0-linux-x64.tar.gz"
    sha256 "8b305111111b6a9b5d8427d596abd0e5478e899490f4cdd682b9efe0812cd807"
  end
  version "5953.0.0"
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
