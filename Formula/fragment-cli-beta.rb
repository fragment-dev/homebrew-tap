require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3073.0.0-darwin-x64.tar.gz"
    sha256 "27262740dd1a2489df2a62829cd6188d11cc01a68bdc0c6c72bddaaa26d9be7e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3073.0.0-darwin-arm64.tar.gz"
      sha256 "a215d1d6237153ee71834fe0cb60b262fc3d0c7e1bf2155097f5e4933fb31b71"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3073.0.0-linux-x64.tar.gz"
    sha256 "fdfbb8e5f5e8ee11a7786802b147cc75430b5fb44d86afe55e674140ca90cf6a"
  end
  version "3073.0.0"
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
