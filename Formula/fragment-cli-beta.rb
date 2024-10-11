require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5657.0.0-darwin-x64.tar.gz"
    sha256 "8b637ff45f589107d095cf03a3e3945028c18610d78f1298fe452cb4ceb73822"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5657.0.0-darwin-arm64.tar.gz"
      sha256 "fdfb161fab9b5713305df2710951c0ea8223f7facd9b0bc12e0e9ede5c0e8f03"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5657.0.0-linux-x64.tar.gz"
    sha256 "9d3689ad1a61e58b8abe3345ff938d2f8ef2c444ebdb0a26e0a1ea26c3e31ebb"
  end
  version "5657.0.0"
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
