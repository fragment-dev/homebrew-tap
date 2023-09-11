require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3516.0.0-darwin-x64.tar.gz"
    sha256 "6eedf464ee72a3c6a767174e3c7686c6829a3e1e7fee9f55f825cc4dd2d30d2b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3516.0.0-darwin-arm64.tar.gz"
      sha256 "a2790f02b0026cf128428657842ecbb4e5ea13633950832c7e66a40e13a2972a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3516.0.0-linux-x64.tar.gz"
    sha256 "2af92d3d4ffb60cb9af62a4771225e8c64489d566f2bb7125e442798eba3cbdf"
  end
  version "3516.0.0"
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
