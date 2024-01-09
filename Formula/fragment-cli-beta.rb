require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4291.0.0-darwin-x64.tar.gz"
    sha256 "54312c9c0fec44e8486adb732440cb837239a45a3a873193e0562365bd21ad2d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4291.0.0-darwin-arm64.tar.gz"
      sha256 "4ae94ae6bb6149bc8417b202b690ff1556c45697732d135918256bbea6bd0341"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4291.0.0-linux-x64.tar.gz"
    sha256 "fc2e465f8c4e68f2a9464fdd039294b508ee9afaffe05062140d1c128426e90c"
  end
  version "4291.0.0"
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
