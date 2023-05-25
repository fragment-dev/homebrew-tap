require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2741.0.0-darwin-x64.tar.gz"
    sha256 "16db4d22d8b33a9b3481199615cfdd82d2edd869ae7f3efd159846be87f7ec2d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2741.0.0-darwin-arm64.tar.gz"
      sha256 "26a36921fa3f31ed1abbe0ba9eff93f9adf9fcee96723870ec6749361f3541f9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2741.0.0-linux-x64.tar.gz"
    sha256 "4b540a2dc46ae8e258fde4b25fa90450b0b3c61854aa1eb0b97f6f8713c56d68"
  end
  version "2741.0.0"
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
