require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3994.0.0-darwin-x64.tar.gz"
    sha256 "dad6482d693f176e380326b36b59d34a21d84a1c7956373c4d779b6c401cb0f5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3994.0.0-darwin-arm64.tar.gz"
      sha256 "8128bd63064e0e470b76ef7e4086d610a972082f80039268a2ac5338478f26b7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3994.0.0-linux-x64.tar.gz"
    sha256 "89294b464fe0badea948aeab93baa4470ef4692782f08a1b050fc1eaf338e179"
  end
  version "3994.0.0"
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
