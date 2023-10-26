require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3909.0.0-darwin-x64.tar.gz"
    sha256 "52ceaea9704852d9d4f9532be153d67dc31c477fdbbf69e458ea7e6ba530e86f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3909.0.0-darwin-arm64.tar.gz"
      sha256 "de0883a49a55f73714a6a968bf98e78ba6ebbbe9ddf7dc7afe61c6c94b724011"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3909.0.0-linux-x64.tar.gz"
    sha256 "8a086902173831fbd825071f5043aa0ccf865e54efd17f904d1e31ec3d890191"
  end
  version "3909.0.0"
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
