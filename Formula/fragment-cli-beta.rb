require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4347.0.0-darwin-x64.tar.gz"
    sha256 "e0fcfbc49a072a0fbee24b5ede04d2e18dc722516b3dd40f4e04c47721552599"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4347.0.0-darwin-arm64.tar.gz"
      sha256 "452cf7668ffb9e138a5a120c446c42e0ed289f70338a0d45356ac6e16a102086"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4347.0.0-linux-x64.tar.gz"
    sha256 "b3caeae3c1e4267e4114f3659d8ab2290c8d62ac5b94bc4046aa7733c8b43dc7"
  end
  version "4347.0.0"
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
