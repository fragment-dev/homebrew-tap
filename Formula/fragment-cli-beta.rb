require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4677.0.0-darwin-x64.tar.gz"
    sha256 "a5e605b6b0873ff8a422563dae98f809e55390669a72a9612f8f3bb36f60336c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4677.0.0-darwin-arm64.tar.gz"
      sha256 "fd7b20cbfc282e07a912de026e8f1994a23dd9a7bc7366f7cc752288cb4f5185"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4677.0.0-linux-x64.tar.gz"
    sha256 "dce7d26949f90774d798ec1e3f119d2ac386b981e97567251cb6dcbe503b8bc3"
  end
  version "4677.0.0"
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
