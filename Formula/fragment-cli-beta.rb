require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3867.0.0-darwin-x64.tar.gz"
    sha256 "8a5137da2471138023fed90364ae127e8a824a8c4bd98a2873ba52596fc39307"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3867.0.0-darwin-arm64.tar.gz"
      sha256 "7733f4ae9f595a1f3ddee06b189ac0afb209c409db1905518f299aa2dba1e826"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3867.0.0-linux-x64.tar.gz"
    sha256 "c1b0edd7b60f0807a9de216359f4a19c14ea48b0fc38e6303a5665a015c597a3"
  end
  version "3867.0.0"
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
