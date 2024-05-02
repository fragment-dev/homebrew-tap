require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4992.0.0-darwin-x64.tar.gz"
    sha256 "14e8679f733d399d46acc50e3419994b840c22667d8659f7d09f64b4a0cb3f22"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4992.0.0-darwin-arm64.tar.gz"
      sha256 "757c2058a1da042101dacff2456f4d9a27cb042d98516f27c42bb4283436c01e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4992.0.0-linux-x64.tar.gz"
    sha256 "81e86000d7e913a98ba1c2845dbfa3916f5e5a538bd852ba21efe6d70f12ce78"
  end
  version "4992.0.0"
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
