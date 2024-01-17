require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4360.0.0-darwin-x64.tar.gz"
    sha256 "e935d175a41f77a9b0cc4f7835019e5dfa021b8d6383d3c88da47cdfba637b2c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4360.0.0-darwin-arm64.tar.gz"
      sha256 "61a43f5e4e3149f8d660a18de10487ef90b5666b89317cda065a4e8193005f08"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4360.0.0-linux-x64.tar.gz"
    sha256 "244a8662f6c118437d37e8dc3443fd2086f858979210556c620dbdc241782691"
  end
  version "4360.0.0"
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
