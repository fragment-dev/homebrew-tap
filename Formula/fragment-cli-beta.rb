require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2195.0.0-darwin-x64.tar.gz"
    sha256 "3f441ebacd79eea6c9fb2cf73d07b2cdddcae575ce5d7e98be4a6e75fff20596"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2195.0.0-darwin-arm64.tar.gz"
      sha256 "aaf41ea17d95b0783bf355633b8a592b24f273df5ed3697cf8dcaf0516f673d2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2195.0.0-linux-x64.tar.gz"
    sha256 "5cf7d5e216ec1f57a6c4bc3d6e7110b68caaf2343b47acac9bd5d3fd6ebab960"
  end
  version "2195.0.0"
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
