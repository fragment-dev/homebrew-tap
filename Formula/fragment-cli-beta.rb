require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2418.0.0-darwin-x64.tar.gz"
    sha256 "ff13da00f5bbc42cc2520fe3e866b192f28b5ef908b496e8639ecf30654009a7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2418.0.0-darwin-arm64.tar.gz"
      sha256 "6ff032e935f881461504379c485b410263993d6261749874da1d70d030c064f9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2418.0.0-linux-x64.tar.gz"
    sha256 "c90e6eb88f242f6602b1107671c2148380913e2c2a5cd24336b194cd8e66ac45"
  end
  version "2418.0.0"
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
