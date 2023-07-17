require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3080.0.0-darwin-x64.tar.gz"
    sha256 "1e53397509e2e2d0d81e054afd5e2432d96bcaa3b60f242673504f8ac254a380"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3080.0.0-darwin-arm64.tar.gz"
      sha256 "e19d29217904fff0528885927f2b6b973c80b05a069331806bfe9258e430c40f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3080.0.0-linux-x64.tar.gz"
    sha256 "94305de9650f304abdfeed1f19d6379f77c2394f3a01b57e456894c4865e900e"
  end
  version "3080.0.0"
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
