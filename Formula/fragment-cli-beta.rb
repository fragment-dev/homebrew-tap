require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5504.0.0-darwin-x64.tar.gz"
    sha256 "8d32b09be813b2ec24470383ef868092e8c971d9deafdb08e09ca710a0d63baa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5504.0.0-darwin-arm64.tar.gz"
      sha256 "1c5f2e1c571e29743ffe69509a62841f64bdd8b48760d81ea7b62db3ef467dce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5504.0.0-linux-x64.tar.gz"
    sha256 "3b8cc766131560f507505033fce66a2efa873c8d6cc274d66a4170f5c2167538"
  end
  version "5504.0.0"
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
