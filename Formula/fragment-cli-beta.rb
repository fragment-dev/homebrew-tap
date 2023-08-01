require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3202.0.0-darwin-x64.tar.gz"
    sha256 "4cc0241288ec2b2bc4c0bc4bab415e6e9345be124038dfe6b7a62bd888f9471b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3202.0.0-darwin-arm64.tar.gz"
      sha256 "7aea70325d5f952a7a8d82c22178e02979ecdf741875566f9b7ae4150d39fdbe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3202.0.0-linux-x64.tar.gz"
    sha256 "fa282760beb58d28b5668da2bef6bee8b711099e60cb789bb7e6983bf01d1be0"
  end
  version "3202.0.0"
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
