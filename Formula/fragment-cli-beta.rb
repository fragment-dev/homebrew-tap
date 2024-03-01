require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4683.0.0-darwin-x64.tar.gz"
    sha256 "6028e50b6faf84798b9f7afeb000b69db18ee5362d4db86d7257d29effb7e619"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4683.0.0-darwin-arm64.tar.gz"
      sha256 "b080f7b5a9077efa0f3a834b4a1eef6350e859c1d6621a1521989b26304a7107"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4683.0.0-linux-x64.tar.gz"
    sha256 "d004509c0f28d4e44ae51cca74d5afd0991a1032a515aabd7219ad4d75d99754"
  end
  version "4683.0.0"
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
