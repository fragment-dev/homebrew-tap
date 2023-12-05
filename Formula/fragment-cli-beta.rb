require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4097.0.0-darwin-x64.tar.gz"
    sha256 "076602c1912d13ee305e60d1d0a5572fedb6799a2deb5c04fe2b6b36abde2955"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4097.0.0-darwin-arm64.tar.gz"
      sha256 "706fe649fe717ed1c907906d3dcaf42258181fcecd83797f4bab197497993ed6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4097.0.0-linux-x64.tar.gz"
    sha256 "57a8b9d5e41a2404d743d1372a0022ca9100516ca525742cd6fc3c83793887af"
  end
  version "4097.0.0"
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
