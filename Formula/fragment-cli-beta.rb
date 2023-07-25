require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3158.0.0-darwin-x64.tar.gz"
    sha256 "ef1c59836f7770ff296d8fba13c24a552f180a90224e5fdb1d3d49aa1f674340"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3158.0.0-darwin-arm64.tar.gz"
      sha256 "f0850b03ec02a930750038ce579fc63ff86e366dc1607539adc072ba6ca33b49"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3158.0.0-linux-x64.tar.gz"
    sha256 "25c51a959897d8cdccf192b3564afc38710bf37f047ef323627de9dc874cd0a1"
  end
  version "3158.0.0"
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
