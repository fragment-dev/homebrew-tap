require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2544.0.0-darwin-x64.tar.gz"
    sha256 "37583a3ba6e3a6e76e644d9860feb2f141726ff5a2755a73a67c04f4c87cdf3d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2544.0.0-darwin-arm64.tar.gz"
      sha256 "e9f529be6dfe6ec626efa211a493532182e5009b5b2c66a1bbfab1c320770c39"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2544.0.0-linux-x64.tar.gz"
    sha256 "30de6ac3a02ab2c21e491065ea1cae0e562f25cdb8ce30df82814157a0fceafc"
  end
  version "2544.0.0"
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
