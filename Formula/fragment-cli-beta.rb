require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4452.0.0-darwin-x64.tar.gz"
    sha256 "32fda3b2f5662582f404f0c3dc6b107570289aa04af415f812108ad0e0b863eb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4452.0.0-darwin-arm64.tar.gz"
      sha256 "7ed4d7c30f4f43807a7c6978857720348b813f596b320986d591c576e289ab2f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4452.0.0-linux-x64.tar.gz"
    sha256 "d473ef4a0643cf5969b94f9ed5a34bfcdf1bfbb323abfc71a179ecd0ca01b90e"
  end
  version "4452.0.0"
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
