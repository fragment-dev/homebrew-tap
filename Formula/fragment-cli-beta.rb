require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5190.0.0-darwin-x64.tar.gz"
    sha256 "9a51a493dec81fce643406e5f29ec6e2567952b0802c06d71a14b7f7d7762728"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5190.0.0-darwin-arm64.tar.gz"
      sha256 "b25f0eee8b322847d3d5dc2c0994812ee5b95082d45188203b5c91c670485cef"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5190.0.0-linux-x64.tar.gz"
    sha256 "4ce9a94742c7c3767388220738b4d76dea9d082d8f8148f04b7805f2b662d121"
  end
  version "5190.0.0"
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
