require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4901.0.0-darwin-x64.tar.gz"
    sha256 "56b9aa1d38d2544aef7b84a51cfe79e3dfc224773c369110ced4611cb02e1cbf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4901.0.0-darwin-arm64.tar.gz"
      sha256 "0d84dc993c6df671784646c121a085b1a6f9ebdf0238ff35a64e1eb3d0dfdeda"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4901.0.0-linux-x64.tar.gz"
    sha256 "9376a501fc1ea01e8e7728e4c67d466c3e0655cceffb8ae64c851fd79b586e22"
  end
  version "4901.0.0"
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
