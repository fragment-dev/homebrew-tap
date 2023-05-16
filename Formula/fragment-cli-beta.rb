require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2680.0.0-darwin-x64.tar.gz"
    sha256 "0c95cb0bafb737f43ec4c788704a62b6548ea3fef5f982144f0cea2ac23b7614"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2680.0.0-darwin-arm64.tar.gz"
      sha256 "eceafbff7e43c57965d71913006dee2855c8b6e42bd01d5fe3d245f7c3bb8f70"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2680.0.0-linux-x64.tar.gz"
    sha256 "5ad7bde76808b35eab298d8f9d82526a4cf1d01e52ad633642b55d5cfadadc2a"
  end
  version "2680.0.0"
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
