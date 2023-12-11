require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4132.0.0-darwin-x64.tar.gz"
    sha256 "d99e5c11af13f2525745d90fadae6fe922759fc8efcc9bf4654db5a2735a8526"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4132.0.0-darwin-arm64.tar.gz"
      sha256 "00fdcf4c2136e51110e633099eee05ab6d6c81dcc55a93f532bfd65b27c173e0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4132.0.0-linux-x64.tar.gz"
    sha256 "bd6386c672ab24246bfb434876285736caf244a40b6e81412c482ce621947600"
  end
  version "4132.0.0"
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
