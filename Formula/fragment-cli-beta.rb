require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2466.0.0-darwin-x64.tar.gz"
    sha256 "e50ddb21dd711975d7fd271a158ea18602524bd4a13cff020bd3d546bc50122d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2466.0.0-darwin-arm64.tar.gz"
      sha256 "368f1988546f4d40540c2e1b96e7865d8cb8f9b7ff929af07d45b2378f56d9b4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2466.0.0-linux-x64.tar.gz"
    sha256 "fe75b62f5bbe007d5617c84fefd6f0c21562d523ba4207325d76780d28f71722"
  end
  version "2466.0.0"
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
