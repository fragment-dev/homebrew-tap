require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4126.0.0-darwin-x64.tar.gz"
    sha256 "104161e08c94d3f40e979259ebb1e14579ca3af390f7bef4170a49846e83ac6a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4126.0.0-darwin-arm64.tar.gz"
      sha256 "d0bf318b1b1e53de39cd85c6fdc58e4247f20309c7367f95aa146ab338559b7b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4126.0.0-linux-x64.tar.gz"
    sha256 "debbf3cfa0fb03d408dbbc06315f35496a1b93ba379900a0c2d8945a5ada9842"
  end
  version "4126.0.0"
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
