require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5033.0.0-darwin-x64.tar.gz"
    sha256 "0ca7a01eafc0fdd96fe93dc34a26537a44d87619781e2b9f07416df32fd34e6b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5033.0.0-darwin-arm64.tar.gz"
      sha256 "a481d137f1c5dc90149b099560d295aa6d1d34cf4e9046f3485705c6f8593651"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5033.0.0-linux-x64.tar.gz"
    sha256 "4893d3f2f9dc56b06f823ee4770f9ee174cbec470594510728f25676b279d0ba"
  end
  version "5033.0.0"
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
