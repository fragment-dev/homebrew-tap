require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2705.0.0-darwin-x64.tar.gz"
    sha256 "b4577a9d1b90c8788dd6782051f71e410f10bb759bdddeddf27a2d21722b7978"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2705.0.0-darwin-arm64.tar.gz"
      sha256 "679403c2188e6a673148310e0800a8e6e1c4d8ce32ee501e572c0fcc730a7e3f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2705.0.0-linux-x64.tar.gz"
    sha256 "17c47d2f30f3a0f3c85e3bd4f372ecddbc011e46ca6f10892bcb9a599aaa7b06"
  end
  version "2705.0.0"
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
