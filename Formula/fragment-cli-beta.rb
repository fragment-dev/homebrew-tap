require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4392.0.0-darwin-x64.tar.gz"
    sha256 "f0eb1c980baae189e085fa79dc1c8591a89673c6bbf69c748519592341b8bf5a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4392.0.0-darwin-arm64.tar.gz"
      sha256 "4e850fe6896f80d30f06d66b0bf8a74af991b12eb22b77e0c43496ed733bad9d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4392.0.0-linux-x64.tar.gz"
    sha256 "cd792d453aac0011d324149aac5e2d2fe5cee96b86f2a79f93cc2af6d552f078"
  end
  version "4392.0.0"
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
