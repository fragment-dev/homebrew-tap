require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5136.0.0-darwin-x64.tar.gz"
    sha256 "d84de666324a16beddb748ab186dba5a60616852f78469247110d050e2c709ac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5136.0.0-darwin-arm64.tar.gz"
      sha256 "5705512207221f1b853927db819334c28c19db1f57d1cbecfcdc9ec3f9f702ab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5136.0.0-linux-x64.tar.gz"
    sha256 "91e71df6cb77b8466483cccfa98ff01a2183ef0f0d5b9b2df6dfb50f809bc152"
  end
  version "5136.0.0"
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
