require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6013.0.0-darwin-x64.tar.gz"
    sha256 "6d47387f8722812e3bc33d94014d815b1edc0a3945fa84b41178e5d0a320cbbb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6013.0.0-darwin-arm64.tar.gz"
      sha256 "84480d4da42a74373228fea2ccb25f237d8e24e24ccdb0990a85e624b188dc82"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6013.0.0-linux-x64.tar.gz"
    sha256 "fe4e259a642233c4c85bf62d5086cb4e3578966155ef1385cefa48405124e28c"
  end
  version "6013.0.0"
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
