require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2816.0.0-darwin-x64.tar.gz"
    sha256 "172021786bf1a37cc98f4880ecd8688ef299399458909f34817947d0d768459e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2816.0.0-darwin-arm64.tar.gz"
      sha256 "5c6a73f4e3c7aca0d59ad929b03d40d7983bb8d247e70b68aad212ef732ffeec"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2816.0.0-linux-x64.tar.gz"
    sha256 "7ee5373093b6cc23f1ea2e967e53571b4455f2bed181cabec41edca26f2fbeee"
  end
  version "2816.0.0"
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
