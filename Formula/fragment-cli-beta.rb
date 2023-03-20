require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2241.0.0-darwin-x64.tar.gz"
    sha256 "10a6cf12d1800f114ff47573be8d12988f594b315eaa89dba45c524a0331d635"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2241.0.0-darwin-arm64.tar.gz"
      sha256 "bc261e7d5703c666d3734b9254732b23b69757f9051c8f4de3cc3b90e15448e4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2241.0.0-linux-x64.tar.gz"
    sha256 "3ed5ab3d802e0f80cc32501cda7d699f6ba31ac134f5057ed42db030b2303e8c"
  end
  version "2241.0.0"
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
