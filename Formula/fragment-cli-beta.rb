require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4011.0.0-darwin-x64.tar.gz"
    sha256 "f9c9db68629e5060d5ba8dbd13d66f997d4dc7bea6dd3c4481625c1736b95b33"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4011.0.0-darwin-arm64.tar.gz"
      sha256 "8f7088841b53adb1ea349b5d18e43b719adf863a2ffde84de367f00d0f64a0b6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4011.0.0-linux-x64.tar.gz"
    sha256 "11304d15dc54f5479b8c3d9db007111ae14bca20ccde3305cf4830385dc564a4"
  end
  version "4011.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
