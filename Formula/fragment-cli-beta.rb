require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4042.0.0-darwin-x64.tar.gz"
    sha256 "c72a312ec41d467bfeba84d8c682b9824c3af257c0f58afd344babcc98b67b39"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4042.0.0-darwin-arm64.tar.gz"
      sha256 "4c458f3a673129c6f1c80ba4132db2e38308326bf63ed429a942de8eb774a382"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4042.0.0-linux-x64.tar.gz"
    sha256 "8efded5df92635ee2f329e3ee331c7d690f742442a45285fc60ca7a22488fdf7"
  end
  version "4042.0.0"
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
