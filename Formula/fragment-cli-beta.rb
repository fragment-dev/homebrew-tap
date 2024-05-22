require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5106.0.0-darwin-x64.tar.gz"
    sha256 "97c77b46f93e64eb0c81b26ee541b04c753d54e77d728fd4ba55653ea2a77a72"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5106.0.0-darwin-arm64.tar.gz"
      sha256 "5ce5d0c864e9238a01fbff94ea1efeaf90625149b5dc2888c7d5f29153d47fcd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5106.0.0-linux-x64.tar.gz"
    sha256 "61ce28c5a4775e58ff43c1859bc00bb2a05002404ceac24ec5179a5a2a88befb"
  end
  version "5106.0.0"
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
