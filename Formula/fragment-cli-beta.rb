require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4903.0.0-darwin-x64.tar.gz"
    sha256 "7bcacef8952048d54abd1c6f6e034e7db397d00a15044e536c802b42c499737d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4903.0.0-darwin-arm64.tar.gz"
      sha256 "9837178e5d30eef9605ba6f1b3dccd77b161d460448e118f9a0c1af3ce9155a6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4903.0.0-linux-x64.tar.gz"
    sha256 "3a6e43f4c4101b3d70d1e2e9fd49498ce805c092f019498293b39bf128a761bb"
  end
  version "4903.0.0"
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
