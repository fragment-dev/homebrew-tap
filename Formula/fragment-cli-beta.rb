require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2275.0.0-darwin-x64.tar.gz"
    sha256 "2488b5c8ad61e4ba000e3e6e5aa6fee9e4b4ac0efaedcb910e71c02453385166"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2275.0.0-darwin-arm64.tar.gz"
      sha256 "7e99782b197cae716db19c5ea517c679f2261835b35dba467df84c63109452c2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2275.0.0-linux-x64.tar.gz"
    sha256 "79f10deec04a1e76af1929e7824822879e9a58c7c66fd5853a674ec2a632f5bf"
  end
  version "2275.0.0"
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
